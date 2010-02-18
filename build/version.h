#define NAME          "PhreeqcCOM"
#define VER_MAJOR      2
#define VER_MINOR     17
#define VER_PATCH      0  
#define VER_REVISION   0

#define RELEASE_DATE           "@RELEASE_DATE@"

#define APR_STRINGIFY(n) APR_STRINGIFY_HELPER(n)
#define APR_STRINGIFY_HELPER(n) #n

/** Version number */
#define VER_NUM                APR_STRINGIFY(VER_MAJOR) \
                           "." APR_STRINGIFY(VER_MINOR) \
                           "." APR_STRINGIFY(VER_PATCH) \
                           "." APR_STRINGIFY(VER_REVISION)



#define PRODUCT_NAME   NAME \
                       "-" APR_STRINGIFY(VER_MAJOR) \
                       "." APR_STRINGIFY(VER_MINOR)


#define PHREEQCI_VER_NUM_REG        APR_STRINGIFY(VER_MAJOR) \
                                "." APR_STRINGIFY(VER_MINOR)
